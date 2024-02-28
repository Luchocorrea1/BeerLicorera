import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-recordar-usuario',
  templateUrl: './recordar-usuario.component.html',
  styleUrls: ['./recordar-usuario.component.css']
})
export class RecordarUsuarioComponent implements OnInit {
  recordarForm: FormGroup; // Define una variable para el formulario reactivo.

  constructor(private fb: FormBuilder) { 
    this.recordarForm = this.fb.group({
      // Crea el FormGroup (formulario reactivo) con controles definidos.
      email: ['', Validators.required],
    });
  }

  ngOnInit(): void {
  }

  onSubmit(){
    
  }

}
