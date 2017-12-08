// child ProductDetailComponent
import {Component, EventEmitter, Input, Output} from "@angular/core";
import {Product} from './product/product';

@Component ({
    selector: 'product-detail',
    template: `<h2>Product Detail</h2><div *ngIf="product">Name: <input [value]="product.name" (input)="product.name=$event.target.value" size="50"/><br/><br/>Price: <input [value]="product.price" (input)="product.price=$event.target.value" size="50"/><br/><br/>Desc: <input [value]="product.description" (input)="product.description=$event.target.value" size="50"/><br/><br/>
    <input (click)="requestDelete()" type="button" value="Delete"/></div>`,
    styles: ['input {font-size:100%; color:orange} h2{color:dodgerblue} div{color:dodgerblue} button{font-size:150%}']

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