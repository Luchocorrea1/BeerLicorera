import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BackendCommunicationService } from '../../services/backend-communication.service';

@Component({
  selector: 'app-recordar-usuario',
  templateUrl: './recordar-usuario.component.html',
  styleUrls: ['./recordar-usuario.component.css']
})
export class RecordarUsuarioComponent implements OnInit {
  recordarForm: FormGroup; // Define una variable para el formulario reactivo.

  constructor(private fb: FormBuilder, private Execute:BackendCommunicationService) { 
    this.recordarForm = this.fb.group({
      // Crea el FormGroup (formulario reactivo) con controles definidos.
      email: ['', Validators.required],
    });
  }

  ngOnInit(): void {
  }

  onSubmit(){

    const params =  this.recordarForm.value;
    // this.http.post<any>(apiUrl, params)
    // .subscribe(function(data) {
    //   console.log('Usuario encontrado:');
    // },function (error) {
    //   console.error('Error al buscar usuario:', error);
    // });

    this.Execute.post<any>('auth/forgot-password',params)
    .subscribe(function(data) {
      console.log('Usuario encontrado:');
    },function (error) {
      console.error('Error al buscar usuario:', error);
    });
  }

}
