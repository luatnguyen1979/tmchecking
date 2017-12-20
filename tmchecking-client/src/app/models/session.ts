export class Session {
  constructor( private date: Date, private duration: string,
               private timeframe: string, private status: string,
               private isNotified: boolean, private counselorId: string,
               private userId: string) {}
}
