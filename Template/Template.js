import React, { PropTypes } from 'react';
import styles from './styles.scss';

class Template extends React.Component {
  static propTypes = {
  }

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div className={styles.Template}>
        Template
      </div>
    );
  }
}

export default Template;
