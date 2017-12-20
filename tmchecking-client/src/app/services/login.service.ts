import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Headers } from '@angular/http';
import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {User} from '../models/user';
import {ServerConfiguration} from '../consts/server.config';

@Injectable()
export class LoginService {
  constructor ( private router: Router ) {}

  login(http: HttpClient, username: string, password: string): any {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json'});
    headers.set('Access-Control-Allow-Origin', '*');
    headers.set('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, DELETE, OPTIONS');
    headers.set('Access-Control-Allow-Headers', 'Origin, Content-Type, X-Auth-Token');

    const url = ServerConfiguration._url + '/users/authenticate';
    const params = JSON.stringify({email: username, password: password});

    http.post<User>(url, params, {'headers': headers}).subscribe(
      res => {
        if (res != null) {
          localStorage.setItem('id', res[0]._id);
          localStorage.setItem('email', res[0].email);
          localStorage.setItem('role', res[0].role);
        }
        return true;
      },
      error => {
        return false;
      }
    );
  }
}
