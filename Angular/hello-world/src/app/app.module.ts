import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { TestComponent } from './test/test.component';
import { MaterialPocComponent } from './material-poc/material-poc.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Test2CompComponent } from './test2-comp/test2-comp.component';

@NgModule({
  declarations: [
    AppComponent,
    TestComponent,
    MaterialPocComponent,
    Test2CompComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
