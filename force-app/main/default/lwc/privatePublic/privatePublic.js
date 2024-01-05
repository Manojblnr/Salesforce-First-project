import { LightningElement, api } from 'lwc';

export default class PrivatePublic extends LightningElement {
    message= 'public property';
    @api recordId;
}