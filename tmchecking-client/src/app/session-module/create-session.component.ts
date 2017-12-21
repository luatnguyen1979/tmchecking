import {Component, Injectable, OnInit} from '@angular/core';
import {SessionService} from '../services/session.service';
import {HttpClient} from '@angular/common/http';
import {User} from '../models/user';

@Component({
  selector: 'app-create-session',
  templateUrl: './create-section.html'
})
@Injectable()
export class CreateSectionComponent implements OnInit {
  constructor(private http: HttpClient, private sessionService: SessionService) {}
  counselors: User[] = new Array();

  submit(obj) {
    this.sessionService.createSession(this.http, obj.date, obj.frame, obj.counselor);
  }

  ngOnInit() {
    this.counselors = this.sessionService.getCounselors(this.http);
  }
}
