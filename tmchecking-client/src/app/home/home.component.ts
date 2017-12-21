import {Component, Input, OnInit} from '@angular/core';
import { Session } from '../models/session';
import {SessionService} from '../services/session.service';
import {HttpClient} from '@angular/common/http';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  sessions: Session[] = new Array();
  @Input() url: string;
  constructor(private http: HttpClient, private sessionService: SessionService) { }
    ngOnInit() {
      // this.sessions = this.sessionService.getSessions(this.http);

      // TESTING ONLY
      /*this.sessions.push(new Session('1', new Date(), '30m', '9:30-10:00', 'Available', false, 'counselor-1', ''));
      this.sessions.push(new Session('2', new Date(), '30m', '10:00-10:30', 'Booking', false, 'counselor-1', 'student-1'));
      this.sessions.push(new Session('3', new Date(), '60m', '10:30-11:30', 'Complete', false, 'counselor-1', 'student-1'));

      this.sessions.push(new Session('4', new Date(), '30m', '9:30-10:00', 'Available', false, 'counselor-2', ''));
      this.sessions.push(new Session('5', new Date(), '30m', '10:00-10:30', 'Available', false, 'counselor-2', ''));
      this.sessions.push(new Session('6', new Date(), '60m', '10:30-11:30', 'Available', false, 'counselor-2', ''));
      */
  }

  abc(url: string) {
    alert(url);
  }
}
