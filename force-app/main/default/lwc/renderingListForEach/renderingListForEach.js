import { LightningElement } from 'lwc';

export default class RenderingListForEach extends LightningElement {
    contacts = [
        {
            Id: 1,
            Name: 'Test one',
            Title: 'First Title'
        },
        {
            Id: 2,
            Name: 'Test two',
            Title: 'Two Title'
        },
        {
            Id: 3,
            Name: 'Test three',
            Title: 'Three Title'
        }
    ]
}