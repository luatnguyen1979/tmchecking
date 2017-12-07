import {Component, Output} from "@angular/core";
import {Product} from './product';
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

export class ProductsList {
    productslist = [
        { id: '1', name: 'iPhone X', category: 'Smart Phone', price: '1000', description:'This is excellent smart Phone of Apple' },
        { id: '2', name: 'Samsung Galaxy S8', category: 'Smart Phone', price: '900', description:'This is excellent smart Phone Samsung' },
        { id: '3', name: 'iPhone 8', category: 'Smart Phone', price: '700', description:'This is second excellent smart Phone' },
        { id: '4', name: 'Samsung Gala Note8', category: 'Tablet', price: '1000', description:'This is second excellent tablet of Samsung' },
        { id: '5', name: 'iPad Pro', category: 'Tablet', price: '650', description:'This is second excellent Tablet' },
        { id: '6', name: 'Apple TV', category: 'Smart TV', price: '150', description:'This is second excellent smart TV' }
    ];

    @Output()
    selectedProduct: Product;

    delete(item: Product) {
        for (let i = 0; i < this.productslist.length; i++) {
            if (item.id === this.productslist[i].id) {
                this.productslist.splice(i,1);
            }
        }

    }
}