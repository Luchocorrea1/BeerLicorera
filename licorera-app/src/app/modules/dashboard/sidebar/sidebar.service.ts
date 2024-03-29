import { Injectable } from '@angular/core';
import { MenuItem } from './menu-item';

@Injectable({
  providedIn: 'root'
})
export class SidebarService {
  toggled = false;
  _hasBackgroundImage = true;

  menus: MenuItem[] = [
    {
      title: 'General',
      type: 'header'
    },
    // {
    //   title: 'Dashboard',
    //   icon: 'fa fa-tachometer',
    //   active: false,
    //   type: 'dropdown',
    //   badge: {
    //     text: 'New ',
    //     class: 'badge-warning'
    //   },
    //   submenus: [
    //     {
    //       title: 'Dashboard 1',
    //       badge: {
    //         text: 'Pro ',
    //         class: 'badge-success'
    //       }
    //     },
    //     {
    //       title: 'Dashboard 2'
    //     },
    //     {
    //       title: 'Dashboard 3'
    //     }
    //   ]
    // },
    {
      title: 'Ventas',
      icon: 'fa fa-shopping-cart',
      active: false,
      type: 'simple',
      href: '/dashboard/ventas'
    },
    {
      title: 'Productos',
      icon: 'fa fa-diamond',
      active: true,
      type: 'simple',
      href: '/dashboard/productos'
    },
    // {
    //   title: 'Charts',
    //   icon: 'fa fa-line-chart',
    //   active: false,
    //   type: 'dropdown',
    //   submenus: [
    //     {
    //       title: 'Pie chart',
    //     },
    //     {
    //       title: 'Line chart'
    //     },
    //     {
    //       title: 'Bar chart'
    //     },
    //     {
    //       title: 'Histogram'
    //     }
    //   ]
    // },
    // {
    //   title: 'Maps',
    //   icon: 'fa fa-globe',
    //   active: false,
    //   type: 'dropdown',
    //   submenus: [
    //     {
    //       title: 'Google maps',
    //     },
    //     {
    //       title: 'Open street map'
    //     }
    //   ]
    // },
    // {
    //   title: 'Extra',
    //   type: 'header'
    // },
    // {
    //   title: 'Documentation',
    //   icon: 'fa fa-book',
    //   active: false,
    //   type: 'simple',
    //   badge: {
    //     text: 'Beta',
    //     class: 'badge-primary'
    //   },
    // },
    // {
    //   title: 'Calendar',
    //   icon: 'fa fa-calendar',
    //   active: false,
    //   type: 'simple'
    // },
    // {
    //   title: 'Examples',
    //   icon: 'fa fa-folder',
    //   active: false,
    //   type: 'simple'
    // }
  ];
  constructor() { }

  toggle() {
    this.toggled = ! this.toggled;
  }

  getSidebarState() {
    return this.toggled;
  }

  setSidebarState(state: boolean) {
    this.toggled = state;
  }

  getMenuList() {
    return this.menus;
  }

  get hasBackgroundImage() {
    return this._hasBackgroundImage;
  }

  set hasBackgroundImage(hasBackgroundImage) {
    this._hasBackgroundImage = hasBackgroundImage;
  }
}
