export interface MenuItem {
    title: string;
    icon?: string;
    active?: boolean;
    type?: string;
    badge?: { text: string; class: string; };
    submenus?: MenuItem[];
  }