import {Component, Input, OnInit} from '@angular/core';
import { Session } from '../models/session';
import {SessionService} from '../services/session.service';
import {HttpClient} from '@angular/common/http';
import {ServerConfiguration} from '../consts/server.config';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  sessions: Session[] = new Array();
  bisCounselor = false;

  @Input() url: string;
  constructor(private http: HttpClient, private sessionService: SessionService) { }
    ngOnInit() {
      const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
      this.bisCounselor = isCounselor === 'true';
  }

  refereshTabContent(url: string) {
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    this.bisCounselor = isCounselor === 'true';
    const fullUrl = ServerConfiguration._url + url + localStorage.getItem('id') + '/' + isCounselor;
    alert(fullUrl);
    this.sessions = this.sessionService.getSessionsByUrl(this.http, fullUrl);
  }
}
