import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-test2-comp',
  template: `
        <p>{{ " hello " + parentData }}</p>
        `,
  styleUrls: ['./test2-comp.component.css']
})
export class Test2CompComponent implements OnInit {

  @Input() public parentData;

  constructor() { }

  ngOnInit(): void {
  }

}
