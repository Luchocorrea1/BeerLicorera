import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RecordarUsuarioComponent } from './recordar-usuario.component';

describe('RecordarUsuarioComponent', () => {
  let component: RecordarUsuarioComponent;
  let fixture: ComponentFixture<RecordarUsuarioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RecordarUsuarioComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RecordarUsuarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
