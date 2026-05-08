        ┌──────────────┐
        │   GitHub     │
        │  Repository  │
        └──────┬───────┘
               │ Webhook
               ▼
        ┌──────────────┐
        │   Jenkins    │
        │ (EC2 Server) │
        └──────┬───────┘
               │
   ┌───────────┼────────────┐
   ▼           ▼            ▼
Checkout     Test      Docker Build
   ▼
Stop Old Container
   ▼
Run New Container
   ▼
┌──────────────┐
│ Docker (Nginx│
│  Web App)    │
└──────┬───────┘
       ▼
 Browser Access
