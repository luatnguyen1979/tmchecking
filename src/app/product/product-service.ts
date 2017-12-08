import { Injectable } from '@angular/core';
import {Product} from "./product";
import {Observable} from "rxjs/Observable";
import { of } from 'rxjs/observable/of';

@Injectable()
export class ProductService {
    productslist = [];

    constructor(){
        this.productslist = [ new Product('1', 'iPhone X', 'Smart Phone', '1000', 'This is excellent smart Phone of Apple'),
            new Product('2', 'Samsung Galaxy S8', 'Smart Phone', '900', 'This is excellent smart Phone Samsung'),
            new Product('3', 'iPhone 8', 'Smart Phone', '700', 'This is second excellent smart Phone'),
            new Product('4', 'Samsung Gala Note8', 'Tablet', '1000', 'This is second excellent tablet of Samsung'),
            new Product('5', 'iPad Pro', 'Tablet', '650', 'This is second excellent Tablet'),
            new Product('6', 'Apple TV', 'Smart TV', '150', 'This is second excellent smart TV')];
    }

    getAllProducts() : Observable<Product[]>{
        console.log('Getting Product list');
        return of(this.productslist);
    }

    getProductById(productId) {
        console.log('Getting a Product by product id');
        for (let i = 0; i < this.productslist.length; i++) {
            if (productId === this.productslist[i].id) {
                return this.productslist[i];
            }
        }
        return null;
    }

    remove(productId) {
        console.log('Delete a Product based on product id');
        for (let i = 0; i < this.productslist.length; i++) {
            if (productId === this.productslist[i].id) {
                this.productslist.splice(i,1);
            }
        }
    }
}
