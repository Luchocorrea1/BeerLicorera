export interface MenuItem {
    title: string;
    href?: string;
    icon?: string;
    active?: boolean;
    type?: string;
    badge?: { text: string; class: string; };
    IdMenu?: number;
    submenus?: MenuItem[];
  }