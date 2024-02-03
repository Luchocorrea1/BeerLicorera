// dashboard.module.ts

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router'; 
import { DashboardComponent } from './dashboard.component';
import { ProductosComponent } from './pages/productos/productos.component';
import { VentasComponent } from './pages/ventas/ventas.component';
import { AuthGuard } from 'src/app/services/auth.guard';

import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';

// import { BsDropdownModule } from 'ngx-bootstrap';
import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';

import { SidebarComponent } from './sidebar/sidebar.component';


const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};

const routes: Routes = [
  {
    path: 'dashboard',
    component: DashboardComponent, canActivate: [AuthGuard],
    children: [
      { path: 'productos', component: ProductosComponent },
      { path: 'ventas', component: VentasComponent },
      // Agrega más rutas para otras páginas del dashboard
      { path: '', redirectTo: 'productos', pathMatch: 'full' }, // Página predeterminada
    ],
  },
];

@NgModule({
  declarations: [DashboardComponent, ProductosComponent, VentasComponent, SidebarComponent], //PageOneComponent, PageTwoComponent],
  imports: [
    CommonModule,
    //Material Angular
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatIconModule,

    // BsDropdownModule.forRoot(),

    RouterModule.forChild(routes),
    PerfectScrollbarModule
  ],
  providers: [ {
    provide: PERFECT_SCROLLBAR_CONFIG,
    useValue: DEFAULT_PERFECT_SCROLLBAR_CONFIG
  }],
  bootstrap: [DashboardComponent]
})
export class DashboardModule {}
