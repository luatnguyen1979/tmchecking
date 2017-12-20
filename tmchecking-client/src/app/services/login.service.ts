import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Headers } from '@angular/http';
import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {User} from '../models/user';

@Injectable()
export class LoginService {
  constructor ( private router: Router ) {}

  login(http: HttpClient, username: string, password: string): any {
    // this.router.navigate(['/']);
    const headers = new HttpHeaders({ 'Content-Type': 'application/json'});
    headers.set('Access-Control-Allow-Origin', '*');
    headers.set('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, DELETE, OPTIONS');
    headers.set('Access-Control-Allow-Headers', 'Origin, Content-Type, X-Auth-Token');
    const url = 'http://192.168.0.22:3000/users/authenticate';
    const params = JSON.stringify({email: username, password: password});

    http.post<User>(url, params, {'headers': headers}).subscribe(
      data => {
        // localStorage.setItem('currentUser', data.get)
        console.log(data);
        return data;
      },
      error => {
        console.log(error);
        return null;
      }
    );
  }
}
