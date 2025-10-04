// Main JavaScript file for Informatika Website
class InformatikaWebsite {
    constructor() {
        this.init();
    }

    init() {
        this.setupNavigation();
        this.setupThemeToggle();
        this.setupScrollAnimations();
        this.setupTabSwitching();
        this.setupContactForm();
        this.setupIntersectionObserver();
        this.setupParallaxEffects();
        this.setupSmoothScrolling();
        this.setupVideoModal();
        this.setupAccordion();
    }

    // Navigation functionality
    setupNavigation() {
        const navbar = document.getElementById('navbar');
        const navToggle = document.getElementById('nav-toggle');
        const navMenu = document.getElementById('nav-menu');
        const navLinks = document.querySelectorAll('.nav-link');
        const dropdowns = document.querySelectorAll('.dropdown');

        // Mobile menu toggle
        navToggle.addEventListener('click', () => {
            navToggle.classList.toggle('active');
            navMenu.classList.toggle('active');
        });

        // Close mobile menu when clicking on a non-dropdown link
        navLinks.forEach(link => {
            if (!link.classList.contains('has-dropdown')) {
                link.addEventListener('click', () => {
                    navToggle.classList.remove('active');
                    navMenu.classList.remove('active');
                });
            }
        });

        // Handle dropdowns in mobile view
        dropdowns.forEach(dropdown => {
            const link = dropdown.querySelector('.has-dropdown');
            link.addEventListener('click', (e) => {
                if (window.innerWidth <= 768) {
                    e.preventDefault();
                    dropdown.classList.toggle('active');
                }
            });
        });

        // Navbar scroll effect
        window.addEventListener('scroll', () => {
            if (window.scrollY > 100) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Active link highlighting
        this.setupActiveNavigation();
    }

    setupActiveNavigation() {
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.nav-menu .nav-link');
        const currentPage = window.location.pathname.split('/').pop();

        const activateLink = (link) => {
            navLinks.forEach(l => l.classList.remove('active'));
            if(link) {
                link.classList.add('active');
                const dropdown = link.closest('.dropdown');
                if (dropdown) {
                    dropdown.querySelector('.has-dropdown').classList.add('active');
                }
            }
        };

        if (currentPage === 'learning.html' || currentPage === 'services.html') {
            const resourceLink = document.querySelector(`.dropdown-item[href="${currentPage}"]`);
            activateLink(resourceLink);
        } else {
            window.addEventListener('scroll', () => {
                let current = '';
                sections.forEach(section => {
                    const sectionTop = section.offsetTop;
                    if (window.pageYOffset >= sectionTop - 200) {
                        current = section.getAttribute('id');
                    }
                });

                const activeLink = document.querySelector(`.nav-link[href="/#${current}"]`);
                activateLink(activeLink);
            });
        }
    }

    // Theme toggle functionality
    setupThemeToggle() {
        const themeToggle = document.getElementById('theme-toggle');
        const html = document.documentElement;

        const savedTheme = localStorage.getItem('theme') || 'light';
        html.setAttribute('data-theme', savedTheme);

        themeToggle.addEventListener('click', () => {
            const currentTheme = html.getAttribute('data-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            
            html.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            
            html.style.transition = 'all 0.3s ease';
            setTimeout(() => {
                html.style.transition = '';
            }, 300);
        });
    }

    // Scroll animations
    setupScrollAnimations() {
        const animateElements = document.querySelectorAll('.about-card, .research-card, .lab-card, .faculty-card, .activity-card, .program-card, .track-card, .learning-card, .pricing-card, .pricing-card-small');
        
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        animateElements.forEach(element => {
            element.style.opacity = '0';
            element.style.transform = 'translateY(30px)';
            element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(element);
        });
    }

    // Tab switching functionality
    setupTabSwitching() {
        const tabContainers = document.querySelectorAll('.academic-tabs');
        tabContainers.forEach(container => {
            const tabButtons = container.querySelectorAll('.tab-btn');
            const tabPanes = container.querySelectorAll('.tab-pane');

            tabButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const targetTab = button.getAttribute('data-tab');

                    tabButtons.forEach(btn => btn.classList.remove('active'));
                    tabPanes.forEach(pane => pane.classList.remove('active'));

                    button.classList.add('active');
                    container.querySelector(`#${targetTab}`).classList.add('active');
                });
            });
        });
    }

    // Contact form functionality
    setupContactForm() {
        const contactForm = document.getElementById('contact-form');
        if (!contactForm) return;
        
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const submitButton = contactForm.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;
            submitButton.textContent = 'Mengirim...';
            submitButton.disabled = true;

            setTimeout(() => {
                this.showNotification('Pesan berhasil dikirim! Kami akan segera menghubungi Anda.', 'success');
                contactForm.reset();
                
                submitButton.textContent = originalText;
                submitButton.disabled = false;
            }, 2000);
        });
    }

    // Intersection Observer for various animations
    setupIntersectionObserver() {
        const counters = document.querySelectorAll('.stat-number');
        if (counters.length === 0) return;
        
        const counterObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counter = entry.target;
                    const targetValueText = counter.textContent || '';
                    const targetValue = parseInt(targetValueText.replace(/\D/g, ''));
                    this.animateCounter(counter, targetValue);
                    observer.unobserve(counter);
                }
            });
        }, { threshold: 0.8 });

        counters.forEach(counter => {
            counterObserver.observe(counter);
        });
    }

    // Counter animation
    animateCounter(element, target) {
        let current = 0;
        const increment = target / 100;
        const isPercentage = (element.textContent || '').includes('%');
        const hasPlus = (element.textContent || '').includes('+');
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                current = target;
                clearInterval(timer);
            }
            
            let displayValue = Math.ceil(current);
            if (isPercentage) {
                element.textContent = displayValue + '%';
            } else if (hasPlus) {
                element.textContent = displayValue + '+';
            } else {
                element.textContent = displayValue;
            }
        }, 20);
    }

    // Parallax effects
    setupParallaxEffects() {
        const hero = document.querySelector('.hero');
        if (!hero) return;

        const matrixRain = hero.querySelector('.matrix-rain');
        const floatingElements = hero.querySelector('.floating-elements');

        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            
            if (matrixRain) {
                matrixRain.style.transform = `translateY(${scrolled * 0.3}px)`;
            }
            
            if (floatingElements) {
                floatingElements.style.transform = `translateY(${scrolled * 0.2}px)`;
            }
        });
    }

    // Notification system
    showNotification(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.innerHTML = `<div class="notification-content"><span class="notification-message">${message}</span><button class="notification-close">&times;</button></div>`;

        if (!document.querySelector('#notification-styles')) {
            const styles = document.createElement('style');
            styles.id = 'notification-styles';
            styles.textContent = `
                .notification { position: fixed; top: 20px; right: 20px; z-index: 9999; max-width: 400px; padding: 1rem 1.5rem; border-radius: 0.5rem; box-shadow: var(--shadow-xl); transform: translateX(calc(100% + 20px)); transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94); }
                .notification.show { transform: translateX(0); }
                .notification-success { background: var(--success); color: white; }
                .notification-error { background: var(--error); color: white; }
                .notification-info { background: var(--primary); color: white; }
                .notification-content { display: flex; justify-content: space-between; align-items: center; gap: 1rem; }
                .notification-close { background: none; border: none; color: white; font-size: 1.5rem; cursor: pointer; padding: 0; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center; opacity: 0.7; }
                .notification-close:hover { opacity: 1; }
            `;
            document.head.appendChild(styles);
        }

        document.body.appendChild(notification);

        setTimeout(() => notification.classList.add('show'), 100);

        notification.querySelector('.notification-close').addEventListener('click', () => this.hideNotification(notification));
        setTimeout(() => this.hideNotification(notification), 5000);
    }

    hideNotification(notification) {
        if (!notification) return;
        notification.classList.remove('show');
        setTimeout(() => notification.remove(), 500);
    }

    // Smooth scrolling for anchor links
    setupSmoothScrolling() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                if (href.length > 1) {
                    e.preventDefault();
                    const target = document.querySelector(href);
                    if (target) {
                        const offsetTop = target.offsetTop - 80;
                        window.scrollTo({ top: offsetTop, behavior: 'smooth' });
                    }
                }
            });
        });
    }

    // Video Modal Functionality
    setupVideoModal() {
        const videoModal = document.getElementById('video-modal');
        if (!videoModal) return;

        const closeButton = document.getElementById('video-modal-close');
        const youtubePlayer = document.getElementById('youtube-player');
        const videoLinks = document.querySelectorAll('.video-link[data-youtube-id]');

        const openModal = (youtubeId) => {
            youtubePlayer.src = `https://www.youtube.com/embed/${youtubeId}?autoplay=1&rel=0`;
            videoModal.classList.add('active');
        };

        const closeModal = () => {
            videoModal.classList.remove('active');
            // Stop the video from playing in the background
            youtubePlayer.src = '';
        };

        videoLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const youtubeId = link.dataset.youtubeId;
                if (youtubeId) {
                    openModal(youtubeId);
                }
            });
        });

        closeButton.addEventListener('click', closeModal);

        videoModal.addEventListener('click', (e) => {
            // Close modal if clicking on the background overlay
            if (e.target === videoModal) {
                closeModal();
            }
        });

        // Close modal with Escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && videoModal.classList.contains('active')) {
                closeModal();
            }
        });
    }

    // Accordion functionality
    setupAccordion() {
        const accordionItems = document.querySelectorAll('.accordion-item');
        accordionItems.forEach(item => {
            const header = item.querySelector('.accordion-header');
            header.addEventListener('click', () => {
                item.classList.toggle('active');
            });
        });
    }
}

// Enhanced Matrix Rain Effect
class MatrixRain {
    constructor() {
        this.container = document.querySelector('.matrix-rain');
        if (!this.container) return;
        
        this.canvas = document.createElement('canvas');
        this.ctx = this.canvas.getContext('2d');
        this.container.innerHTML = '';
        this.container.appendChild(this.canvas);
        
        this.chars = '01';
        this.fontSize = 14;
        this.drops = [];
        
        this.init();
    }

    init() {
        this.resize();
        window.addEventListener('resize', () => this.resize());
        this.animate();
    }

    resize() {
        this.canvas.width = this.container.offsetWidth;
        this.canvas.height = this.container.offsetHeight;
        
        const columns = Math.floor(this.canvas.width / this.fontSize);
        this.drops = [];
        for (let i = 0; i < columns; i++) {
            this.drops[i] = 1;
        }
    }

    animate() {
        this.ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
        
        this.ctx.fillStyle = '#0052cc';
        this.ctx.font = this.fontSize + 'px monospace';
        
        for (let i = 0; i < this.drops.length; i++) {
            const text = this.chars[Math.floor(Math.random() * this.chars.length)];
            this.ctx.fillText(text, i * this.fontSize, this.drops[i] * this.fontSize);
            
            if (this.drops[i] * this.fontSize > this.canvas.height && Math.random() > 0.975) {
                this.drops[i] = 0;
            }
            this.drops[i]++;
        }
        
        requestAnimationFrame(() => this.animate());
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new InformatikaWebsite();
    new MatrixRain();
});
