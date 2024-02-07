// backend-communication.service.ts
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';  // Agrega catchError

import { ConfigService } from './config.service';
import { AuthService } from './auth.service';
import { NotificationService } from './notification.service';
import { ToastService } from './toast.service';
import { EventTypes } from '../models/event-types';
import { ErrorMessages } from '../models/error-messages';

@Injectable({
  providedIn: 'root',
})
export class BackendCommunicationService {
  private apiUrl = '';

  constructor(private http: HttpClient, private authService: AuthService, private configService: ConfigService, 
    private notificationService: NotificationService,private toastService: ToastService) {
    this.apiUrl = configService.backendUrl;
  }

  private getHeaders(): HttpHeaders {
    let headers = new HttpHeaders({
      'accept': 'application/json;odata=verbose',
      'content-Type': 'application/json;odata=verbose',
    });

    const token = this.authService.getSessionToken();
    if (token) {
      headers = headers.set('Authorization', `Bearer ${token}`);
    }
    return headers;
  }

  get<T>(endpoint: string): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}/${endpoint}`, { headers: this.getHeaders() })
    .pipe(
      catchError((error: any) => {
        // const errorMessage = this.getErrorMessage(error);
        // this.notificationService.showError('Error en la solicitud: ' + error.message);
        this.toastService.showToast('Error', error.message, EventTypes.Error)
        throw error;
      })

    );
  }

  post<T>(endpoint: string, body: any): Observable<T> {
    return this.http.post<T>(`${this.apiUrl}/${endpoint}`, body, { headers: this.getHeaders() })
      .pipe(
        catchError((error: any) => {
          const errorMessage = this.getErrorMessage(error);
          // this.notificationService.showError('Error en la solicitud: ' + error.message);
          this.toastService.showToast('Error', errorMessage, EventTypes.Error)
          throw error;
        })

      );
  }

  delete<T>(endpoint: string): Observable<T> {
    return this.http.delete<T>(`${this.apiUrl}/${endpoint}`, { headers: this.getHeaders() });
  }

  put<T>(endpoint: string, body: any): Observable<T> {
    return this.http.put<T>(`${this.apiUrl}/${endpoint}`, body, { headers: this.getHeaders() });
  }

  patch<T>(endpoint: string, body: any): Observable<T> {
    return this.http.patch<T>(`${this.apiUrl}/${endpoint}`, body, { headers: this.getHeaders() });
  }

  sendEmail<T>(email: string, subject: string, message: string): Observable<T> {
    const body = {
      email,
      subject,
      message,
    };

    return this.post<T>('email/send', body);
  }

  private getErrorMessage(error: HttpErrorResponse): string {
    const errorCodeMessage = ErrorMessages[`E${error.status}` as keyof typeof ErrorMessages];
    return errorCodeMessage || 'Error en la solicitud: ' + error.message;
  }
}
