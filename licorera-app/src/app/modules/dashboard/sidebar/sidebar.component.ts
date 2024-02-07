import { Component, OnInit } from '@angular/core';
import { trigger, state, style, transition, animate } from '@angular/animations';
import { SidebarService } from './sidebar.service';
import { MenuItem } from './menu-item';

import { AuthService } from 'src/app/services/auth.service';
import { BackendCommunicationService } from 'src/app/services/backend-communication.service';
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

  menus: MenuItem[];
  usuario: Usuario = {Nombre:'', Apellido:'', Rol:''}

  constructor(public sidebarservice: SidebarService, private authService:AuthService, private Execute:BackendCommunicationService) {
    this.menus = sidebarservice.getMenuList();
    this.getUserData();
   }
   toggleSidebar() {
    this.sidebarservice.setSidebarState(!this.sidebarservice.getSidebarState());
  }
  ngOnInit() {
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
    }
  }

  getState(currentMenu:MenuItem) {

    if (currentMenu.active) {
      return 'down';
    } else {
      return 'up';
    }
  }

  hasBackgroundImage() {
    return this.sidebarservice.hasBackgroundImage;
  }
  logOut(){
    this.authService.logout();
  }

  getUserData() {
    this.Execute.get<any>('users/me?populate=role')
      .subscribe((response: any) => {
        // Manejar la respuesta del backend.
        this.usuario.Nombre=response.Nombre;
        this.usuario.Apellido=response.Apellido;
        this.usuario.Rol=response.role?.name;
        
      });
  }
}
