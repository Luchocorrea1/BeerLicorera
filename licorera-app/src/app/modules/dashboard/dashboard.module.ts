// dashboard.module.ts

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router'; 
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

//Components
import { DashboardComponent } from './dashboard.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { ProductosComponent } from './pages/productos/productos.component';
import { VentasComponent } from './pages/ventas/ventas.component';
import { EditProductoComponent } from './pages/productos/edit-producto/edit-producto.component';


//Services
import { AuthGuard } from 'src/app/services/auth.guard';



// import { BsDropdownModule } from 'ngx-bootstrap';
import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';



import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatCardModule} from '@angular/material/card';
import { MatRippleModule } from '@angular/material/core';
import { MatDividerModule } from '@angular/material/divider';
import {MatTooltipModule} from '@angular/material/tooltip';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDialogModule } from '@angular/material/dialog';
import {MatExpansionModule} from '@angular/material/expansion';
import {MatSelectModule} from '@angular/material/select';
import {MatProgressBarModule} from '@angular/material/progress-bar';

import {  CurrencyMaskConfig, CurrencyMaskModule, CURRENCY_MASK_CONFIG } from "ng2-currency-mask";

import { NgxDropzoneModule } from 'ngx-dropzone';

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};

export const CustomCurrencyMaskConfig: CurrencyMaskConfig = {
  align: "left",
  allowNegative: true,
  decimal: ",",
  precision: 2,
  prefix: "COP$ ",
  suffix: "",
  thousands: "."
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
  declarations: [DashboardComponent, ProductosComponent, VentasComponent, SidebarComponent, EditProductoComponent], //PageOneComponent, PageTwoComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule, 
    //Material Angular
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    MatCardModule,
    MatRippleModule,
    MatDividerModule,
    MatTooltipModule,
    MatInputModule,
    MatFormFieldModule,
    MatDialogModule,
    MatExpansionModule,
    MatSelectModule,
    MatProgressBarModule,

    // MatExpansionModule,
    // MatAccordion,
    // BsDropdownModule.forRoot(),
    CurrencyMaskModule,
    NgxDropzoneModule,

    RouterModule.forChild(routes),
    PerfectScrollbarModule
  ],
  providers: [ {
    provide: PERFECT_SCROLLBAR_CONFIG,
    useValue: DEFAULT_PERFECT_SCROLLBAR_CONFIG
  },
  { provide: CURRENCY_MASK_CONFIG, useValue: CustomCurrencyMaskConfig }],
  bootstrap: [DashboardComponent]
})
export class DashboardModule {}
