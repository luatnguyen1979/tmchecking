export class Session {
  constructor( public _id: string, public date: Date, public duration: string,
               public timeframe: string, public status: string,
               public isNotified: boolean, public counselorId: string,
               public userId: string) {}
}
