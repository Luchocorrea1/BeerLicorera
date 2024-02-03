import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms'; // Importa herramientas para trabajar con formularios reactivos.
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

import { ConfigService } from 'src/app/services/config.service';
import { AuthService } from 'src/app/services/auth.service';
import { BackendCommunicationService } from 'src/app/services/backend-communication.service';
import { ToastService } from 'src/app/services/toast.service';
import { EventTypes } from 'src/app/models/event-types';



@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {
  // Clase del componente LoginFormComponent que implementa la interfaz OnInit.

  loginForm: FormGroup; // Define una variable para el formulario reactivo.

  constructor(private fb: FormBuilder, private http: HttpClient, private router: Router, private configService: ConfigService,
    private authService: AuthService, private Execute: BackendCommunicationService, private toastService: ToastService) {
    // Constructor que recibe el FormBuilder para construir el formulario.
    this.loginForm = this.fb.group({
      // Crea el FormGroup (formulario reactivo) con controles definidos.
      identifier: ['', Validators.required],
      password: ['', Validators.required], // Campo de contraseña, requerido.
      rememberUser: [false],
    });
  }

  ngOnInit() {
    // Método de inicialización de OnInit, puede incluir lógica de inicialización aquí.
  }

  onSubmit() {
    if (this.loginForm.valid) {
      const formData = this.loginForm.value;
      // Convertir los datos a una cadena JSON.
      const jsonData = JSON.stringify(formData);

      this.Execute.post<any>('auth/local', jsonData)
        .subscribe((response: any) => {
          // Manejar la respuesta del backend.
          console.log('Respuesta del backend:', response);
          this.authService.login(response.jwt);

          // Redirigir o realizar acciones adicionales según sea necesario.
          // Ejemplo de redirección a una página después del inicio de sesión exitoso.
          this.router.navigate(['/dashboard']);

        }, error => {
          // console.error('Error en la autenticación:', error);
          this.toastService.showToast('Datos incorrectos','Usuario y/o contraseña son incorrectos.',EventTypes.Warning);
      // Puedes mostrar un mensaje de error al usuario si es necesario.
        });
    } else {
      this.toastService.showToast('Datos incorrectos','Usuario y contraseña son requeridos.',EventTypes.Warning);
      // El formulario no es válido, puedes mostrar mensajes de error o realizar otras acciones.
      // console.error('Formulario no válido. Verifica los campos requeridos.');
    }
  }
}
