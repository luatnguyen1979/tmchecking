import { Component, OnInit } from '@angular/core';
import { Session } from '../models/session';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  sessions: Session[] = new Array();
  constructor() { }
  ngOnInit() {
  }

}
