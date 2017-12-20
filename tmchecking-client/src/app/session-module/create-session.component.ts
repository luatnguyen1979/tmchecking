import {Component} from '@angular/core';

@Component({
  selector: 'app-create-session',
  templateUrl: './create-section.html'
})
export class CreateSectionComponent {
  submit(obj) {
    console.log(obj.value);
  }
}
