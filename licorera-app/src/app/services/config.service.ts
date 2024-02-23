// config.service.ts
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({  //Se utiliza la decoración @Injectable para que Angular sepa que este servicio puede tener dependencias inyectadas.
  providedIn: 'root'
})
export class ConfigService {
  
  backendUrl: string;

  constructor(private router:Router) {
    // Obtener la IP del servidor actual
    const serverIp = window.location.hostname;
    // const serverIp = "192.168.3.44";
    this.backendUrl = `http://${serverIp}:1337/api`;
  }
  navigate(Pagina: string): void {
    this.router.navigate([Pagina]);
  }
}
