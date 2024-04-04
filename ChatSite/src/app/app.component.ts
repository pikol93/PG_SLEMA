import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { AppHeaderComponent } from './view/app-header/app-header.component';
import { AppNavComponent } from './view/app-nav/app-nav.component';
import { AppMainComponent } from './view/app-main/app-main.component';
import { AppFooterComponent } from './view/app-footer/app-footer.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, AppHeaderComponent, AppNavComponent, AppMainComponent, AppFooterComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'ChatSite';
}
