import { AfterViewInit, Component, ViewChild } from '@angular/core';
import {
  ScannerQRCodeConfig,
  ScannerQRCodeResult,
  NgxScannerQrcodeService,
  NgxScannerQrcodeComponent,
  ScannerQRCodeSelectedFiles,
} from 'ngx-scanner-qrcode';

@Component({
  selector: 'app-escaner',
  templateUrl: './escaner.component.html',
  styleUrls: ['./escaner.component.css']
})
export class EscanerComponent implements AfterViewInit {

  public config: ScannerQRCodeConfig = {
    constraints: {
      video: {
        width: window.innerWidth
      },
    },
    // canvasStyles: [
    //   { /* layer */
    //     lineWidth: 1,
    //     fillStyle: '#00950685',
    //     strokeStyle: '#00950685',
    //   },
    //   { /* text */
    //     font: '17px serif',
    //     fillStyle: '#ff0000',
    //     strokeStyle: '#ff0000',
    //   }
    // ],
  };

  public qrCodeResult: ScannerQRCodeSelectedFiles[] = [];
  public qrCodeResult2: ScannerQRCodeSelectedFiles[] = [];

  @ViewChild('action') action!: NgxScannerQrcodeComponent;

  public percentage = 80;
  public quality = 100;

  constructor(private qrcode: NgxScannerQrcodeService) { }

  ngAfterViewInit(): void {
    this.action.isReady.subscribe((res: any) => {
      // this.handle(this.action, 'start');
    });
  }

  public respuesta: string = "";
  public qrCodeFrequencies: { [key: string]: number } = {};
  public count = 0;
  public onEvent(e: ScannerQRCodeResult[], action?: any): void {
    if (e && e.length > 0) {
      // Almacena los resultados en un objeto para contar su frecuencia
      // const qrCodeFrequencies: { [key: string]: number } = {};

      // Contabiliza la frecuencia de cada código QR en los resultados
      e.forEach((result: any) => {
        const qrCode = result.value;
        this.qrCodeFrequencies[qrCode] = (this.qrCodeFrequencies[qrCode] || 0) + 1;
      });

      // Encuentra el código QR más frecuente
      const mostFrequentQRCode = Object.keys(this.qrCodeFrequencies).reduce((a, b) => this.qrCodeFrequencies[a] > this.qrCodeFrequencies[b] ? a : b);

      // Detiene la lectura
      // action && action.pause();
      if (this.count == 10){
        this.handle(action, action.isStart ? 'stop' : 'start');
        this.count=0;
      }
      else
        this.count++;
      // Apaga la cámara
      // action && action.turnOffCamera();
      this.respuesta = mostFrequentQRCode;
      // Muestra el código QR más frecuente en la consola
      console.log("Código QR más frecuente:", mostFrequentQRCode);
    }
  }



  public handle(action: any, fn: string): void {
    const playDeviceFacingBack = (devices: any[]) => {
      // front camera or back camera check here!
      const device = devices.find(f => (/back|rear|environment/gi.test(f.label))); // Default Back Facing Camera
      action.playDevice(device ? device.deviceId : devices[0].deviceId);
    }

    if (fn === 'start') {
      action[fn](playDeviceFacingBack).subscribe((r: any) => {

        console.log(fn, r), alert
      });
    } else {
      action[fn]().subscribe((r: any) => console.log(fn, r), alert);
    }
  }

  public onDowload(action: NgxScannerQrcodeComponent) {
    action.download().subscribe(console.log, alert);
  }

  public onSelects(files: any) {
    this.qrcode.loadFiles(files, this.percentage, this.quality.toString()).subscribe((res: ScannerQRCodeSelectedFiles[]) => {
      this.qrCodeResult = res;
    });
  }

  public onSelects2(files: any) {
    this.qrcode.loadFilesToScan(files, this.config, this.percentage, this.quality.toString()).subscribe((res: ScannerQRCodeSelectedFiles[]) => {
      console.log(res);
      this.qrCodeResult2 = res;
    });
  }

  public onGetConstraints() {
    const constrains = this.action.getConstraints();
    console.log(constrains);
  }

  public applyConstraints() {
    const constrains = this.action.applyConstraints({
      ...this.action.getConstraints(),
      width: 510
    });
    console.log(constrains);
  }
}
