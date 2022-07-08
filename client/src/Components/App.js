import { Routes, Route } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { login } from '../Redux/Reducers/user';
import { mount } from '../Redux/Reducers/company';
import Login from './Login';
import Registration from './Registration';
import Home from './Home';
import Projects from './Projects';
import EstimateContainer from './EstimateContainer';
import Estimates from './Estimates';
import Subcontractors from './Subcontractors';
import '../App.css';




function App() {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  useEffect(() => {
    fetch('/authorized_user')
    .then(r => {
      if (r.ok){
        r.json().then(user => {
          dispatch(login(user))
          dispatch(mount(user.company))
        })
      }
      else {
        r.json().then(json=>console.log(json.error));
        navigate('/login');
    };
    });
  }, []);

  return (
    <>
      <Routes>
        <Route path='/login' element={ <Login /> } />
        <Route path='/register' element={ <Registration /> } />
        
        <Route index='/' element={ <Home /> } >
          <Route path='/projects' element={ <Projects /> } />
          <Route path='/e' element={ <EstimateContainer /> } >
            <Route path='estimates' element={ <Estimates /> } />
            <Route path='subcontractors' element={ <Subcontractors /> } />
          </Route>
          
        </Route>
      </Routes>
    </>
  );
}

export default App;
