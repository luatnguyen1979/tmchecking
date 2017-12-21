
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
                   (click)="handle('acknowledge', session._id, session.userId)">
                  <span class="glyphicon glyphicon glyphicon-ok"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="!bisCounselor && session.status=='Not Schedule Yet'"
                   title="Book Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('book', session._id, session.userId)">
                  <span  class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="bisCounselor  && session.status=='Booking'"
                   title="Reject Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('reject', session._id, session.userId)">
                  <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="!bisCounselor && (session.status=='Booking' || session.status=='Booked')"
                   title="Cancel Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('cancel', session._id, session.userId)">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                  <span><strong></strong></span>
                </a>
                <a href="#" *ngIf="bisCounselor   && session.status=='Booked'"
                   title="Complete Session" class="btn btn-primary a-btn-slide-text"
                   (click)="handle('complete', session._id, session.userId)">

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
  bisCounselor = false;
  @Input() url: string;
  constructor(private http: HttpClient, private sessionService: SessionService) { }
  ngOnInit() {
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';

    this.bisCounselor = isCounselor === 'true';

    const fullUrl = ServerConfiguration._url + this.url + localStorage.getItem('id') + '/' + isCounselor;
    this.sessions = this.sessionService.getSessionsByUrl(this.http, fullUrl);
    // console.log(this.sessions);
  }
  handle (action: string, id: string, userId: string) {
    switch (action) {
      case 'acknowledge':
        this.sessionService.acknowledge(this.http, id);
        break;
      case 'book':
        this.sessionService.book(this.http, id, userId);
        break;
      case 'reject':
        this.sessionService.reject(this.http, id);
        break;
      case 'cancel':
        this.sessionService.cancel(this.http, id);
        break;
      case 'complete':
        this.sessionService.complete(this.http, id);
        break;
      default:
        break;
    }
    const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    const fullUrl = ServerConfiguration._url + this.url + localStorage.getItem('id') + '/' + isCounselor;
    this.sessions = this.sessionService.getSessionsByUrl(this.http, fullUrl);
  }


}
