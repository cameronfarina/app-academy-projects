class Clock {
  constructor() {
      const date = new Date();
      this.time = {
          hours: date.getHours(),
          minutes: date.getMinutes(),
          seconds: date.getSeconds()
      };
      this.printTime();
    // 4. Schedule the tick at 1 second intervals.  
      setInterval(this._tick.bind(this), 1000)
  }

  printTime() {
      const measuredTime = 
      `${this.time['hours'].toString()
      .padStart(2, '0')}:${this.time['minutes'].toString()
      .padStart(2, '0')}:${this.time['seconds'].toString()
      .padStart(2, '0')}`
      console.log(measuredTime)
  }

  _tick() {
    // 1. Increment the time by one second.
      this.time['seconds'] += 1;
        if (this.time['seconds'] === 60) {
          this.time['seconds'] = 0;
          this.time['minutes'] += 1;
          if (this.time['minutes'] === 60) {
            this.time['minutes'] = 0;
            this.time['hours'] += 1;
          }
          this.time['hours'] % 24;
        };
    // 2. Call printTime.
      this.printTime();
  }
}

const clock = new Clock();

