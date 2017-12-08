import {Component, OnDestroy, OnInit, Output} from "@angular/core";
import {Product} from './product/product';
import {ProductService} from "./product/product-service";
import {Observable} from "rxjs/Observable";

@Component ({
    selector: 'products-list',

    template: `<ul>

        <li *ngFor="let product of productslist; let i = index" (click)="selectedProduct= product">
            {{i + 1}} : {{product.name}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: \${{product.price}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desc: {{product.description}}
        </li>
    </ul>
    <product-detail [product] = "selectedProduct" (deleteProduct)="delete($event)"></product-detail>`,
    styles: ['ul { text-align:left; border: solid 2px green; margin-right: 40px; margin-left: 10px; margin-bottom: 10px;padding-top: 20px; padding-bottom: 20px}']
})

export class ProductsList implements OnInit, OnDestroy{
    productslist = [];
    observableProduct: Observable<Product[]>;

    constructor(private productService:ProductService) {
    }


    @Output()
    selectedProduct: Product;

    delete(item: Product) {
        this.productService.remove(item.id);
    }

    ngOnInit() {
        this.observableProduct = this.productService.getAllProducts();
        this.observableProduct.subscribe( (prods) => this.productslist = prods);
    }

    ngOnDestroy () {
        this.productslist = null;
        this.observableProduct = null;
    }
}