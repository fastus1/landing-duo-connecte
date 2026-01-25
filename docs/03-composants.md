# Composants Reutilisables

Code copier-coller pour les sections courantes.

---

## Hero Section

```html
<section class="mlp-hero">
  <div class="mlp-container">
    <!-- Branding -->
    <div class="mlp-brand-header">
      <h1 class="mlp-brand-title">AVANCER SIMPLEMENT</h1>
      <p class="mlp-brand-subtitle">Presente</p>
    </div>

    <!-- Hero content -->
    <h2 class="mlp-hero-title">Transforme ta vie aujourd'hui</h2>
    <p class="mlp-hero-subtitle">
      Rejoins une communaute de passionnes qui avancent ensemble vers leurs objectifs.
    </p>

    <!-- CTA -->
    <div class="mlp-hero-cta">
      <button class="mlp-btn-primary mlp-btn-large">
        Commencer gratuitement
      </button>
      <p class="mlp-hero-note">Aucune carte de credit requise</p>
    </div>
  </div>
</section>

<style>
  .mlp-hero {
    background: linear-gradient(135deg, #074491 0%, #2563EB 100%);
    padding: 80px 20px;
    text-align: center;
    position: relative;
    overflow: hidden;
  }

  .mlp-brand-header {
    margin-bottom: 48px;
  }

  .mlp-brand-title {
    font-family: 'Montserrat', sans-serif;
    font-weight: 900;
    font-style: italic;
    text-transform: uppercase;
    letter-spacing: 0.02em;
    color: white;
    font-size: 32px;
    margin: 0 0 8px 0;
  }

  .mlp-brand-subtitle {
    font-family: 'Inter', sans-serif;
    font-weight: 400;
    font-style: italic;
    letter-spacing: 0.05em;
    color: rgba(255, 255, 255, 0.8);
    font-size: 14px;
    margin: 0;
  }

  .mlp-hero-title {
    color: white;
    font-size: 40px;
    font-weight: 700;
    line-height: 1.2;
    margin: 0 0 20px 0;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
  }

  .mlp-hero-subtitle {
    color: rgba(255, 255, 255, 0.9);
    font-size: 18px;
    line-height: 1.6;
    margin: 0 0 40px 0;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
  }

  .mlp-hero-cta {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
  }

  .mlp-btn-large {
    padding: 16px 40px;
    font-size: 18px;
    min-height: 56px;
  }

  .mlp-hero-note {
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    margin: 0;
  }

  @media (min-width: 768px) {
    .mlp-hero {
      padding: 120px 40px;
    }

    .mlp-brand-title {
      font-size: 48px;
    }

    .mlp-brand-subtitle {
      font-size: 16px;
    }

    .mlp-hero-title {
      font-size: 56px;
    }

    .mlp-hero-subtitle {
      font-size: 20px;
    }
  }
</style>
```

---

## Grid de fonctionnalites

```html
<section class="mlp-features">
  <div class="mlp-container">
    <h3 class="mlp-section-title">Ce que tu vas obtenir</h3>

    <div class="mlp-features-grid">
      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">🚀</div>
        <h4 class="mlp-feature-title">Croissance rapide</h4>
        <p class="mlp-feature-text">
          Des outils et strategies eprouvees pour atteindre tes objectifs rapidement.
        </p>
      </div>

      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">🤝</div>
        <h4 class="mlp-feature-title">Communaute active</h4>
        <p class="mlp-feature-text">
          Rejoins des centaines de membres qui s'entraident chaque jour.
        </p>
      </div>

      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">💡</div>
        <h4 class="mlp-feature-title">Contenu exclusif</h4>
        <p class="mlp-feature-text">
          Accede a des ressources premium creees specialement pour nos membres.
        </p>
      </div>
    </div>
  </div>
</section>

<style>
  .mlp-features {
    padding: 80px 0;
    background: var(--bg-primary);
  }

  .mlp-section-title {
    text-align: center;
    font-size: 36px;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 48px 0;
  }

  .mlp-features-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 24px;
  }

  .mlp-feature-card {
    background: var(--bg-primary);
    padding: 32px;
    border-radius: 12px;
    border: 1px solid var(--border-default, #E5E7EB);
    text-align: center;
    transition: all 0.3s ease;
  }

  .mlp-feature-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    border-color: var(--brand-primary);
  }

  .mlp-feature-icon {
    font-size: 48px;
    margin-bottom: 16px;
  }

  .mlp-feature-title {
    font-size: 20px;
    font-weight: 600;
    color: var(--text-primary);
    margin: 0 0 12px 0;
  }

  .mlp-feature-text {
    font-size: 16px;
    line-height: 1.6;
    color: var(--text-secondary);
    margin: 0;
  }

  @media (min-width: 768px) {
    .mlp-features-grid {
      grid-template-columns: repeat(2, 1fr);
      gap: 32px;
    }

    .mlp-section-title {
      font-size: 48px;
    }
  }

  @media (min-width: 1024px) {
    .mlp-features-grid {
      grid-template-columns: repeat(3, 1fr);
    }
  }
</style>
```

---

## Compteur a rebours

```html
<div class="mlp-countdown-section">
  <div class="mlp-container">
    <p class="mlp-countdown-label">Offre limitee - Plus que :</p>

    <div class="mlp-countdown">
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-days">00</span>
        <span class="mlp-countdown-unit">Jours</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-hours">00</span>
        <span class="mlp-countdown-unit">Heures</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-minutes">00</span>
        <span class="mlp-countdown-unit">Minutes</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-seconds">00</span>
        <span class="mlp-countdown-unit">Secondes</span>
      </div>
    </div>
  </div>
</div>

<style>
  .mlp-countdown-section {
    background: var(--bg-secondary);
    padding: 48px 20px;
    text-align: center;
  }

  .mlp-countdown-label {
    font-size: 18px;
    font-weight: 600;
    color: var(--text-primary);
    margin: 0 0 24px 0;
  }

  .mlp-countdown {
    display: flex;
    justify-content: center;
    gap: 16px;
    flex-wrap: wrap;
  }

  .mlp-countdown-item {
    background: var(--bg-primary);
    border: 2px solid var(--brand-primary);
    border-radius: 12px;
    padding: 20px;
    min-width: 90px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .mlp-countdown-number {
    font-size: 36px;
    font-weight: 700;
    color: var(--brand-primary);
    line-height: 1;
    font-variant-numeric: tabular-nums;
  }

  .mlp-countdown-unit {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: var(--text-secondary);
    margin-top: 8px;
  }

  @media (min-width: 768px) {
    .mlp-countdown-label {
      font-size: 20px;
    }

    .mlp-countdown-item {
      min-width: 110px;
      padding: 24px;
    }

    .mlp-countdown-number {
      font-size: 48px;
    }

    .mlp-countdown-unit {
      font-size: 14px;
    }
  }
</style>

<script>
(function() {
  'use strict';

  // CONFIGURATION - Modifie cette date
  const TARGET_DATE = new Date('2026-12-31T23:59:59').getTime();

  function updateCountdown() {
    const now = new Date().getTime();
    const distance = TARGET_DATE - now;

    if (distance < 0) {
      document.querySelector('.mlp-countdown').innerHTML =
        '<p style="font-size: 20px; color: var(--color-red, #db0e00);">Offre expiree</p>';
      return;
    }

    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    const daysEl = document.getElementById('mlp-days');
    const hoursEl = document.getElementById('mlp-hours');
    const minutesEl = document.getElementById('mlp-minutes');
    const secondsEl = document.getElementById('mlp-seconds');

    if (daysEl) daysEl.textContent = String(days).padStart(2, '0');
    if (hoursEl) hoursEl.textContent = String(hours).padStart(2, '0');
    if (minutesEl) minutesEl.textContent = String(minutes).padStart(2, '0');
    if (secondsEl) secondsEl.textContent = String(seconds).padStart(2, '0');
  }

  updateCountdown();
  setInterval(updateCountdown, 1000);
})();
</script>
```

---

## FAQ Accordeon

```html
<section class="mlp-faq">
  <div class="mlp-container">
    <h3 class="mlp-section-title">Questions frequentes</h3>

    <div class="mlp-faq-list">
      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Comment ca fonctionne ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Inscris-toi, accede au contenu exclusif, et rejoins une communaute de passionnes qui avancent ensemble.</p>
        </div>
      </div>

      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Quel est le prix ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Plusieurs options sont disponibles a partir de 29$/mois. Tu peux annuler a tout moment.</p>
        </div>
      </div>

      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Puis-je essayer gratuitement ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Oui ! Profite de 7 jours d'essai gratuit pour decouvrir tout ce que nous offrons.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .mlp-faq {
    padding: 80px 0;
    background: var(--bg-primary);
  }

  .mlp-faq-list {
    max-width: 800px;
    margin: 0 auto;
  }

  .mlp-faq-item {
    margin-bottom: 16px;
    border: 1px solid var(--border-default, #E5E7EB);
    border-radius: 12px;
    overflow: hidden;
    background: var(--bg-primary);
  }

  .mlp-faq-question {
    width: 100%;
    background: transparent;
    border: none;
    padding: 20px 24px;
    text-align: left;
    font-size: 18px;
    font-weight: 600;
    color: var(--text-primary);
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: background 0.2s ease;
    font-family: var(--font-sans);
  }

  .mlp-faq-question:hover {
    background: var(--bg-secondary);
  }

  .mlp-faq-question:focus {
    outline: none;
    background: var(--bg-secondary);
  }

  .mlp-faq-icon {
    font-size: 28px;
    font-weight: 300;
    color: var(--brand-primary);
    transition: transform 0.3s ease;
    flex-shrink: 0;
    margin-left: 16px;
  }

  .mlp-faq-item.active .mlp-faq-icon {
    transform: rotate(45deg);
  }

  .mlp-faq-answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
  }

  .mlp-faq-answer p {
    padding: 0 24px 24px 24px;
    margin: 0;
    color: var(--text-secondary);
    font-size: 16px;
    line-height: 1.6;
  }

  @media (min-width: 768px) {
    .mlp-faq-question {
      font-size: 20px;
      padding: 24px 32px;
    }

    .mlp-faq-answer p {
      padding: 0 32px 32px 32px;
      font-size: 18px;
    }
  }
</style>

<script>
(function() {
  'use strict';

  document.querySelectorAll('.mlp-faq-question').forEach(button => {
    button.addEventListener('click', function() {
      const item = this.parentElement;
      const answer = this.nextElementSibling;
      const isActive = item.classList.contains('active');

      // Ferme tous les autres items
      document.querySelectorAll('.mlp-faq-item').forEach(otherItem => {
        if (otherItem !== item && otherItem.classList.contains('active')) {
          otherItem.classList.remove('active');
          otherItem.querySelector('.mlp-faq-answer').style.maxHeight = null;
          otherItem.querySelector('.mlp-faq-question').setAttribute('aria-expanded', 'false');
        }
      });

      // Toggle l'item actuel
      if (isActive) {
        item.classList.remove('active');
        answer.style.maxHeight = null;
        this.setAttribute('aria-expanded', 'false');
      } else {
        item.classList.add('active');
        answer.style.maxHeight = answer.scrollHeight + 'px';
        this.setAttribute('aria-expanded', 'true');
      }
    });
  });
})();
</script>
```
