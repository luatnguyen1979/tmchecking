// child ProductDetailComponent
import {Component, EventEmitter, Input, Output} from "@angular/core";
import {Product} from './product';

@Component ({
    selector: 'product-detail',
    template: `<div *ngIf="product">Name: <input [value]="product.name" (input)="product.name=$event.target.value" size="50"/>&nbsp;&nbsp;&nbsp;Price: <input [value]="product.price" (input)="product.price=$event.target.value" size="50"/>&nbsp;&nbsp;&nbsp;Desc: <input [value]="product.description" (input)="product.description=$event.target.value" size="50"/>
    <input (click)="requestDelete()" type="button" value="Delete"/></div>`,

})

export class ProductDetailComponent {
    @Input()
    product: Product;

    @Output()
    deleteProduct = new EventEmitter <Product>();
    requestDelete() {
        this.deleteProduct.emit(this.product);
    }
}