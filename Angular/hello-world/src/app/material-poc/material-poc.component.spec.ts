import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MaterialPocComponent } from './material-poc.component';

describe('MaterialPocComponent', () => {
  let component: MaterialPocComponent;
  let fixture: ComponentFixture<MaterialPocComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MaterialPocComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MaterialPocComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
