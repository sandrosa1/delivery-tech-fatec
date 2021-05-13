import './styles.css';
// import { ReactComponent as MainImage } from './main.svg'
import MainImage from './home_img3.png';
import Footer from '../Footer';
import { Link } from 'react-router-dom';

function Home() {
    return (
        <>
            <div className="home-container">
                <div className="home-content">
                    <div className="home-actions">
                        <h1 className="home-title">Deu fome? Peça já<br /> que entregamos<br /> para você</h1>
                        <h3 className="home-subtitle">Escolha o seu pedido e em poucos minutos<br />levamos na sua porta</h3>
                        <Link to="/orders" className="home-btn-order">FAZER PEDIDO</Link>
                    </div>
                    <div className="home-image">
                        <img className="home-image-resize" src={MainImage} alt='Logo da aplicação' />
                    </div>
                </div>

            </div>
            <Footer />
        </>
    )
}

export default Home;