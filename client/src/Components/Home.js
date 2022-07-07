import { Outlet, useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { setProjects, setCurrentProject } from '../Redux/Reducers/projects';
import { login } from '../Redux/Reducers/user';
import { mount } from '../Redux/Reducers/company';
import ViewNavBar from './ViewNavBar';


export default function Home() {
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

  useEffect(() => {
    fetch('/projects')
    .then(r => {
      if (r.ok){
        r.json().then(projects => {
          dispatch(setProjects(projects))
          dispatch(setCurrentProject(projects[0]))
        })
        navigate('dashboard');
      }
      else {
        r.json().then(json=>console.log(json.error));
        navigate('/login');
    };
    });
  }, [])

  return (
    <div className='pageContainer'>
      <ViewNavBar />
      <Outlet />
    </div>
  )
}
