import {CommonModule} from '@angular/common';
import {NgModule} from '@angular/core';
import {SessionComponent} from './session.component';
import {FilterPipe} from './session.filter';
import {CreateSectionComponent} from './create-session.component';
import {FormsModule} from '@angular/forms';

@NgModule({
  imports: [ CommonModule, FormsModule],
  declarations: [ SessionComponent , FilterPipe, CreateSectionComponent],
  exports: [ SessionComponent, FilterPipe, CreateSectionComponent ],
})
export class SessionModule { }
