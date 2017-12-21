
import {Component, Input, OnInit} from '@angular/core';
import {Session} from '../models/session';
import {SessionService} from '../services/session.service';
import {ServerConfiguration} from '../consts/server.config';
import {HttpClient} from '@angular/common/http';

@Component({
  selector: 'app-session',
  template: `
    <div>
      <table class="table table-bordred table-striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Frame</th>
            <th>Duration</th>
            <th>Student</th>
            <th>Counselor</th>
            <th>Status</th>
            <th>Notified</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr *ngFor="let session of this.sessions">
            <td>{{session.date | date : 'MM/dd/yyyy'}}</td>
            <td>{{session.timeframe}}</td>
            <td>{{session.duration}}</td>
            <td>{{session.userId}}</td>
            <td>{{session.counselorId}}</td>
            <td>{{session.status}}</td>
            <td>{{session.isNotified}}</td>
            <td>
              <div class="row">
                <a href="#" *ngIf="bisCounselor  && session.status=='Booking'" title="Acknowledge" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('acknowledge', session._id)">
                  <span class="glyphicon glyphicon glyphicon-ok"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="!bisCounselor && session.status=='Not Schedule Yet'"
                   title="Book Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('book', session._id)">
                  <span  class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="bisCounselor  && session.status=='Booking'"
                   title="Reject Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('reject', session._id)">
                  <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="!bisCounselor && (session.status=='Booking' || session.status=='Booked')"
                   title="Cancel Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('cancel', session._id)">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="bisCounselor   && session.status=='Booked'"
                   title="Complete Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('complete', session._id)">

                  <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  `
})
export class SessionComponent implements OnInit {
  @Input() sessions: Session[];
  @Input() url: string;
  currentId: string;
  bisCounselor = false;

  constructor(private http: HttpClient, private sessionService: SessionService) { }
  ngOnInit() {
    this.currentId = localStorage.getItem('id');
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    this.bisCounselor = isCounselor === 'true';

    const fullUrl = ServerConfiguration._url + this.url + localStorage.getItem('id') + '/' + isCounselor;
    this.sessions = this.sessionService.getSessionsByUrl(this.http, fullUrl);

    console.log(this.sessions);
  }

  handle (action: string, id: string) {
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    const urlReload = ServerConfiguration._url + this.url + localStorage.getItem('id') + '/' + isCounselor;
    console.log(urlReload);
    console.log('user id' + this.currentId);
    switch (action) {
      case 'acknowledge':
        this.http.put(ServerConfiguration._url + '/sessions/acknowledge/' + id, {}).subscribe(
          (res) => {
            console.log('Acknowledge successfully !!!');
            this.sessions = this.sessionService.getSessionsByUrl(this.http, urlReload);
          });
        break;
      case 'book':
        this.http.put(ServerConfiguration._url + '/sessions/book/' + id + '/' + this.currentId, {}).subscribe(
          (res) => {
            console.log('Book successfully !!!');
            this.sessions = this.sessionService.getSessionsByUrl(this.http, urlReload);
          });
        break;
      case 'reject':
        this.http.put(ServerConfiguration._url + '/sessions/reject/' + id, {}).subscribe(
          (res) => {
            console.log('Reject successfully !!!');
            this.sessions = this.sessionService.getSessionsByUrl(this.http, urlReload);
          });
        break;
      case 'cancel':
        this.http.put(ServerConfiguration._url + '/sessions/cancel/' + id, {}).subscribe(
          (res) => {
            console.log('Cancel successfully !!!');
            this.sessions = this.sessionService.getSessionsByUrl(this.http, urlReload);
          });
        break;
      case 'complete':
        this.http.put(ServerConfiguration._url + '/sessions/complete/' + id, {}).subscribe(
          (res) => {
            console.log('Complete successfully !!!');
            this.sessions = this.sessionService.getSessionsByUrl(this.http, urlReload);
          });
        break;
      default:
        break;
    }
  }
}
