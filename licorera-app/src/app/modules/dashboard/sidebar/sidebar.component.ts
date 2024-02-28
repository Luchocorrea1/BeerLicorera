import { animate, state, style, transition, trigger } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { MenuItem } from './menu-item';
import { SidebarService } from './sidebar.service';

import { List } from 'linqts';
import { EventTypes } from 'src/app/models/event-types';
import { AuthService } from 'src/app/services/auth.service';
import { BackendCommunicationService } from 'src/app/services/backend-communication.service';
import { ConfigService } from 'src/app/services/config.service';
import { ToastService } from 'src/app/services/toast.service';
import { Usuario } from '../../../models/enums';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css'],
  animations: [
    trigger('slide', [
      state('up', style({ height: 0 })),
      state('down', style({ height: '*' })),
      transition('up <=> down', animate(200))
    ])
  ]
})

export class SidebarComponent implements OnInit {

  menus: MenuItem[] = [];
  usuario: Usuario = { Nombre: '', Apellido: '', Rol: '' }

  constructor(private configService: ConfigService, public sidebarservice: SidebarService, private authService: AuthService,
    private Execute: BackendCommunicationService, private toastService: ToastService) {
    // this.menus = sidebarservice.getMenuList();
    // this.menus = new List<MenuItem>;
    this.getUserData();
  }
  toggleSidebar() {
    this.sidebarservice.setSidebarState(!this.sidebarservice.getSidebarState());
  }
  ngOnInit() {
    this.Execute.get<any>('menus?populate=submenus')
      .subscribe((response: any) => {

        const allSubmenus = new List<number>();
        this.menus = new List<MenuItem>(response.data)
          .Select((x: any) => {
            const menu: MenuItem = {
              title: x.attributes.Titulo,
              href: x.attributes.Href,
              icon: x.attributes.Icono,
              active: x.attributes.Activo,
              type: x.attributes.Tipo,
              badge: x.attributes.Badge,
              IdMenu: x.id,
              submenus: x.attributes.submenus
                ? new List<MenuItem>(x.attributes.submenus.data).Select((subMenu: any) => {
                  allSubmenus.Add(subMenu.id); // Agrega el ID del submenú al conjunto
                  return {
                    title: subMenu.attributes.Titulo,
                    href: subMenu.attributes.Href,
                    icon: subMenu.attributes.Icono,
                    active: subMenu.attributes.Activo,
                    type: subMenu.attributes.Tipo,
                    badge: subMenu.attributes.Badge,
                    IdMenu: x.id, // Asigna el ID del menú principal al submenú
                  };
                }).ToArray()
                : undefined,
            };
            return menu;
          })
          .Where((x: any) => (!x.IdMenu || !allSubmenus.Contains(x.IdMenu)))
          .ToArray();
      });
  }

  getSideBarState() {
    return this.sidebarservice.getSidebarState();
  }

  toggle(currentMenu: MenuItem) {
    if (currentMenu.type === 'dropdown') {
      this.menus.forEach(element => {
        if (element === currentMenu) {
          currentMenu.active = !currentMenu.active;
        } else {
          element.active = false;
        }
      });
    } else {
      if (currentMenu.href) {
        this.configService.navigate(currentMenu.href);
      }
    }
  }

  getState(currentMenu: MenuItem) {

    if (currentMenu.active) {
      return 'down';
    } else {
      return 'up';
    }
  }

  hasBackgroundImage() {
    return this.sidebarservice.hasBackgroundImage;
  }
  logOut() {
    this.authService.logout();
  }

  getUserData() {
    this.Execute.get<any>('users/me?populate=role')
      .subscribe((response: any) => {
        // Manejar la respuesta del backend.
        this.usuario.Nombre = response.Nombre;
        this.usuario.Apellido = response.Apellido;
        this.usuario.Rol = response.role?.name;

      }, error => {
        // console.error('Error en la autenticación:', error);
        this.toastService.showToast('Ocurrió un error', 'Error inesperado ' + error.message, EventTypes.Error);
        this.logOut();
        // Puedes mostrar un mensaje de error al usuario si es necesario.
      });
  }
}
