import { Component, OnInit } from '@angular/core';
import { trigger, state, style, transition, animate } from '@angular/animations';
import { SidebarService } from './sidebar.service';
import { MenuItem } from './menu-item';

import { AuthService } from 'src/app/services/auth.service';
import { BackendCommunicationService } from 'src/app/services/backend-communication.service';
import { Usuario } from '../../../models/enums';
import { ConfigService } from 'src/app/services/config.service';
import { ToastService } from 'src/app/services/toast.service';
import { EventTypes } from 'src/app/models/event-types';
import { List } from 'linqts';

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
    this.Execute.get<any>('menus')
      .subscribe((response: any) => {
        
        this.menus = new List<MenuItem>(response.data) 
        .Select((x:any)=> ({
          title : x.attributes.Titulo,
          href: x.attributes.Href,
          icon: x.attributes.Icono,
          active: x.attributes.Activo,
          type: x.attributes.Tipo,
          badge:x.attributes.Badge?JSON.parse(x.attributes.Badge):undefined,
          submenus: x.attributes.submenu
        }))
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
