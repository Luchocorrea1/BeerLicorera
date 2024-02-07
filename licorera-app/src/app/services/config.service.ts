// config.service.ts
import { Injectable } from '@angular/core';

@Injectable({  //Se utiliza la decoración @Injectable para que Angular sepa que este servicio puede tener dependencias inyectadas.
  providedIn: 'root'
})
export class ConfigService {
  
  backendUrl: string;

  constructor() {
    // Obtener la IP del servidor actual
    const serverIp = window.location.hostname;
    this.backendUrl = `http://${serverIp}:1337/api`;
  }
}