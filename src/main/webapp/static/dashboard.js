// Add to dashboard.js
const sidebar = document.querySelector('.sidebar');
const navbar = document.querySelector('.navbar');
const sidebarToggle = document.createElement('button');

// Create toggle button for mobile
sidebarToggle.innerHTML = '<i class="fas fa-bars"></i>';
sidebarToggle.className = 'btn btn-primary d-lg-none mobile-toggle';
sidebarToggle.style.position = 'fixed';
sidebarToggle.style.zIndex = '1040';
sidebarToggle.style.top = '10px';
sidebarToggle.style.left = '10px';
document.body.appendChild(sidebarToggle);

// Toggle sidebar on mobile
sidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('active');
    navbar.classList.toggle('active');
});

// Close sidebar when clicking outside on mobile
document.addEventListener('click', (e) => {
    if (window.innerWidth < 768) {
        if (!sidebar.contains(e.target) && !sidebarToggle.contains(e.target)) {
            sidebar.classList.remove('active');
            navbar.classList.remove('active');
        }
    }
});
const consultationChart = new Chart(document.getElementById('consultationChart'), {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
            label: 'Consultations',
            data: [65, 59, 80, 81, 56, 55],
            borderColor: 'rgba(99, 102, 241, 1)',
            tension: 0.4,
            fill: true,
            backgroundColor: 'rgba(99, 102, 241, 0.2)'
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'top',
            }
        }
    }
});

const progressChart = new Chart(document.getElementById('progressChart'), {
    type: 'doughnut',
    data: {
        labels: ['Completed', 'In Progress', 'Pending'],
        datasets: [{
            data: [55, 30, 15],
            backgroundColor: ['#4ade80', '#fbbf24', '#ef4444']
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom',
            }
        }
    }
});