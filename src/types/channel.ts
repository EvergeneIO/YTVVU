export interface PageInfo {
  totalResults: number;
  resultsPerPage: number;
}

export interface Default {
  url: string;
  width: number;
  height: number;
}

export interface Medium {
  url: string;
  width: number;
  height: number;
}

export interface High {
  url: string;
  width: number;
  height: number;
}

export interface Thumbnails {
  default: Default;
  medium: Medium;
  high: High;
}

export interface Localized {
  title: string;
  description: string;
}

export interface Snippet {
  title: string;
  description: string;
  publishedAt: Date;
  thumbnails: Thumbnails;
  localized: Localized;
  country: string;
}

export interface RelatedPlaylists {
  likes: string;
  uploads: string;
}

export interface ContentDetails {
  relatedPlaylists: RelatedPlaylists;
}

export interface Statistics {
  viewCount: string;
  subscriberCount: string;
  hiddenSubscriberCount: boolean;
  videoCount: string;
}

export interface Item {
  kind: string;
  etag: string;
  id: string;
  snippet: Snippet;
  contentDetails: ContentDetails;
  statistics: Statistics;
  brandingSettings: BrandingSettings;
}

export interface Channel {
  kind: string;
  etag: string;
  pageInfo: PageInfo;
  items: Item[];
}

export interface ChannelBranding {
  title: string;
  keywords?: string;
  country?: string;
}

export interface Image {
  bannerExternalUrl?: string;
}

export interface BrandingSettings {
  channel: ChannelBranding;
  image?: Image;
}
