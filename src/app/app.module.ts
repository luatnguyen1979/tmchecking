import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import {ProductsList} from "./products-list.component";
import {ProductDetailComponent} from "./product-detail.component";
import {Product} from "./product";

@NgModule({
  declarations: [
    AppComponent,
      ProductsList,
      ProductDetailComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
