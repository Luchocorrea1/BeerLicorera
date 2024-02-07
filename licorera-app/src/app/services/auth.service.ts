import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private isAuthenticated: boolean = false;
  private sessionToken: string | null = null;

  constructor(private router: Router) { }

  login(token: string) {
    this.isAuthenticated = true;
    this.sessionToken = token;
    localStorage.setItem('sessionToken', token);
    this.scheduleTokenExpirationCheck(); // Agregar verificación de expiración
  }

  private scheduleTokenExpirationCheck() {
    const token = this.getSessionToken();
    if (token) {
      const tokenData = this.decodeToken(token);
      if (tokenData.exp) {
        setTimeout(() => {
          this.logout(); // Token expirado, cerrar sesión
        }, tokenData.exp);
      }
    }
  }

  private decodeToken(token: string): any {
    // Implementa la decodificación del token aquí (puedes usar una biblioteca como jwt-decode)
    // Ejemplo con jwt-decode:
    // import * as jwtDecode from 'jwt-decode';
    // return jwtDecode(token);
    // Ejemplo simple (no recomendado para producción):
    return JSON.parse(atob(token.split('.')[1]));
  }

  logout(): void {
    if (this.canLogout()) {
      // Realiza acciones de cierre de sesión
      // Por ejemplo, limpia tokens, reinicia propiedades, etc.
      this.isAuthenticated = false;
      this.sessionToken = null;
      localStorage.removeItem('sessionToken');

      // Redirige a la pantalla de inicio de sesión después de cerrar sesión
      this.router.navigate(['/login']).then(() => {
        console.log('Sesión cerrada correctamente y redirigido a la pantalla de inicio de sesión.');
      });
    } else {
      console.log('No se permite cerrar sesión en la pantalla actual.');
    }
  }
  canLogout(): boolean {
    // Agrega aquí la lógica de validación específica
    // Puedes devolver true si es seguro cerrar la sesión o false si no lo es.
    return true;
  }
  isLoggedIn(): boolean {
    // Verifica si el usuario está autenticado.
    return this.isAuthenticated || !!localStorage.getItem('sessionToken');
  }

  getSessionToken(): string | null {
    // Obtiene el token de sesión almacenado.
    return this.sessionToken || localStorage.getItem('sessionToken');
  }

  
}
