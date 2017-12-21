import {Component, Input, OnInit} from '@angular/core';
import { Session } from '../models/session';
import {SessionService} from '../services/session.service';
import {HttpClient} from '@angular/common/http';
import {ServerConfiguration} from '../consts/server.config';
import {Router} from "@angular/router";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  sessions: Session[] = new Array();
  bisCounselor = false;

  @Input() url: string;
  constructor(private http: HttpClient, private sessionService: SessionService, private router: Router) { }
  ngOnInit() {
      const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
      this.bisCounselor = isCounselor === 'true';

  }

  refereshTabContent(url: string) {
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    this.bisCounselor = isCounselor === 'true';
    const fullUrl = ServerConfiguration._url + url + localStorage.getItem('id') + '/' + isCounselor;
    this.sessions = this.sessionService.getSessionsByUrl(this.http, fullUrl);
  }

  logout() {
    console.log('Log out processes !!!')
    localStorage.removeItem('email');
    localStorage.removeItem('id');
    localStorage.removeItem('role');
    document.location.href = document.location.href;
  }

}
