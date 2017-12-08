import { BrowserModule } from '@angular/platform-browser';
import {NgModule, OnDestroy} from '@angular/core';


import { AppComponent } from './app.component';
import {ProductsList} from "./products-list.component";
import {ProductDetailComponent} from "./product-detail.component";
import {ProductService} from "./product/product-service";

@NgModule({
  declarations: [
    AppComponent,
      ProductsList,
      ProductDetailComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [ProductService],
  bootstrap: [AppComponent]
})
export class AppModule {

}


