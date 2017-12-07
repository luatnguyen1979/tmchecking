import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <!--The content below is only a placeholder and can be replaced.-->
    <div style="text-align:center">
      <h1>
        Welcome to {{title}}!
      </h1>
        <products-list></products-list>
    </div>
  `,
  styles: ['div { border: solid 2px red; width: 1300px;font-size: 150%; color:#369; padding-bottom: 10px}']
})
export class AppComponent {
  title = 'App Store';
}
