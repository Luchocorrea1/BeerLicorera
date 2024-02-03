import { Component, ElementRef, EventEmitter, Input, AfterViewInit, Output, ViewChild } from '@angular/core';
import { Toast } from 'bootstrap';
import { fromEvent, take } from 'rxjs';
import { EventTypes } from 'src/app/models/event-types';

@Component({
  selector: 'app-toast',
  templateUrl: './toast.component.html',
  styleUrls: ['./toast.component.css'],
})
export class ToastComponent implements AfterViewInit {
  @Output() disposeEvent = new EventEmitter();

  @ViewChild('toastElement', { static: true })
  toastEl!: ElementRef;

  @Input()
  type!: string;

  @Input()
  title!: string;

  @Input()
  message!: string;

  toast!: Toast;

  ngAfterViewInit() {
    this.show();
  }

  show() {
    this.toast = new Toast(
      this.toastEl.nativeElement,
      // this.type === EventTypes.Error {}
         {
          animation:true,
            autohide: true,
            delay: 5000,
          }
    );

    this.toast.show();

    setTimeout(()=>{
      this.hide();
    },6000);
  }

  hide() {
    this.toast.dispose();
    this.disposeEvent.emit();
  }
  getTypeClass(): string {
    switch (this.type) {
      case 'success':
        return 'bg-success text-light fade show';
      case 'error':
        return 'bg-danger text-light fade show';
      case 'info':
        return 'bg-info text-light fade show';
      case 'warning':
        return 'bg-warning text-dark fade show';
      default:
        return '';
    }
  }
}
