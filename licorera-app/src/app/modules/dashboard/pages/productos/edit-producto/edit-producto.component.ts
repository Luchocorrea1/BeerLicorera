import { Component, Inject, OnInit } from '@angular/core';
import {
  MatDialog,
  MAT_DIALOG_DATA,
  MatDialogRef,
  MatDialogTitle,
  MatDialogContent,
  MatDialogActions,
  MatDialogClose,
} from '@angular/material/dialog';
import { Productos } from '../productos';
import { Lista } from 'src/app/models/enums';
import { BackendCommunicationService } from 'src/app/services/backend-communication.service';

import { List } from 'linqts';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { EventTypes } from 'src/app/models/event-types';
import { ToastService } from 'src/app/services/toast.service';

@Component({
  selector: 'app-edit-producto',
  templateUrl: './edit-producto.component.html',
  styleUrls: ['./edit-producto.component.css']
})


export class EditProductoComponent implements OnInit {
  frmCategoria: FormGroup;

  Categorias: Lista[] = [
    { Value: '', Texto: 'Seleccione' }
  ];


  NuevaCategoria: boolean = false;


  constructor(
    public dialogRef: MatDialogRef<EditProductoComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Productos, private Execute: BackendCommunicationService, private fb: FormBuilder, private toastService: ToastService
  ) {
    this.frmCategoria = this.fb.group({
      // Crea el FormGroup (formulario reactivo) con controles definidos.
      Categoria: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.getCategoria();
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  getCategoria(): void {

    this.Execute.get<any>('categoria-productos')
      .subscribe((response: any) => {
        if (response && response.data.length > 0) {
          this.Categorias = new List<any>(response.data)
            .Select(x => ({ Value: x.id, Texto: x.attributes.Categoria }))
            .OrderBy(x => x.Texto)
            .ToArray();
        }
      });
  }

  files: File[] = [];

  onSelect(event: any) {
    console.log(event);

    if (event.addedFiles && event.addedFiles.length > 0) {
      // Almacena únicamente el primer archivo en el array
      this.files = [event.addedFiles[0]];
    }
  }

  onRemove(event: any) {
    console.log(event);
    this.files.splice(this.files.indexOf(event), 1);
  }

  addCategoria() {

    if (this.frmCategoria.valid) {
      const formData = { "data": this.frmCategoria.value };
      // Convertir los datos a una cadena JSON.
      const jsonData = JSON.stringify(formData);
      this.Execute.post<any>('categoria-productos', formData)
        .subscribe((response: any) => {
          // Manejar la respuesta del backend.
          console.log('Respuesta del backend:', response);
          this.frmCategoria.reset();
          this.NuevaCategoria = false;
          this.getCategoria();

        }, error => {
          // console.error('Error en la autenticación:', error);
          this.toastService.showToast('Ocurrió un error', 'Error inesperado ' + error.message, EventTypes.Error);
          // Puedes mostrar un mensaje de error al usuario si es necesario.
        });

    } else {
      this.toastService.showToast('Datos incorrectos', 'La categoría es requerida.', EventTypes.Error);
    }
  }

}
